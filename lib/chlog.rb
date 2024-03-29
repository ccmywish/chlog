# ------------------------------------------------------
# File          : chlog.rb
# Authors       : Aoran Zeng <ccmywish@qq.com>
# Created on    : <2022-04-15>
# Last modified : <2023-05-09>
#
# chlog:
#
#   Maintain your project's Changelog on the cli.
# ------------------------------------------------------

require_relative 'chlog/version'

class Chlog::Logger

  attr_accessor :sub_category,  # 存储次标题
                :log,           # 存储log
                :highline       # HighLine 实例
                :changelog      # CHANGELOG.md 位置


  def initialize
    require 'highline'
    @highline = HighLine.new

    require 'open3'
    # Prevent current directory is not git directory
    Open3.popen3("git rev-parse --show-toplevel") do |i, o, err, t|
      if err.read.include?("fatal: not a git repository")
        puts "chlog: Not a git directory!" or exit(false)
      else
        @changelog = `git rev-parse --show-toplevel`.chomp + '/CHANGELOG.md'
      end
    end
  end

  require 'date'
  TODAY = Date.today.to_s

  UNRELEASED_TITLE = "## [Unreleased](#) (#{TODAY})"

  TEMPLATE = <<~EOT
    # Changelog

    #{UNRELEASED_TITLE}

    <br>

    ## [Initialize](#) (#{TODAY})

    <br>

    <hr>

    This Changelog is maintained with [chlog](https://github.com/ccmywish/chlog)

  EOT


  def generate_changelog
    file = @changelog
    if File.exist? file
      puts "chlog: Already exists Changelog (#@changelog)" or return false
    else
      File.write(file, TEMPLATE)
      puts "chlog: Generate #@changelog OK!" or return true
    end
  end


  def get_changelog
    file = @changelog
    if File.exist? file
      return File.read file
    else
      abort "chlog: No Changelog exists, use 'chlog -g' to generate!"
    end
  end

end


class Chlog::Logger

  def match_unreleased?(str)
    str =~ /^## \[Unreleased\]\(.*\) \(\d{4}-\d\d-\d\d\)/
  end

  def match_unreleased_fail!(str)
    unless match_unreleased?(str)
      puts  "chlog: Unmatched format with chlog"
      puts
      # "#{lns[1][1..]}"
      abort "Unreleased version must be the third line"
    end
  end

  def match_new_features?(str)
    str =~ /^### New features:/
  end

  def match_enhancements?(str)
    str =~ /^### Enhancements:/
  end

  def match_bug_fixes?(str)
    str =~ /^### Bug fixes:/
  end

  def match_security?(str)
    str =~ /^### Security:/
  end

  def match_compatibility?(str)
    str =~ /^### Compatibility:/
  end

  def match_deprecations?(str)
    str =~ /^### Deprecations:/
  end


  def next_version_index(lns_array)
    nvi = lns_array[3..].each_with_index {break _2 if _1.start_with?("## [") }
    nvi += 3
  end

  def next_category_index(lns_array)
    nci = lns_array[3...nvi].each_with_index {break _2 if _1.start_with?("### ") }

    # The not match return value is not nil!! But an array!!
    if nci.is_a(Integer) then nci += 3
    else nil end
  end

=begin
### New features:

- xaaaaa
- xbbbbb
- xccccc    [-> this]
=end
  def find_main_category_last_list_item_index(lns,
                                              main_cat_index,
                                              first_lower_order_category_index)
    mci = main_cat_index
    nci = first_lower_order_category_index

    list_i = lns[mci+2..nci].each_with_index do
      break _2 if _1  !~  /^- .*/
    end
    list_i += mci+2 - 1
  end


  LIST__Feature = %w[
    new_features  enhancements    bug_fixes
    security      compatibility  deprecations
  ]

  # New features
  # Enhancements
  # Bug fixes
  # Security
  # Compatibility
  # Deprecations
  LIST__Main_Category = LIST__Feature.map do
    _1.split('_').join(' ').capitalize
  end

  # match_new_features?
  # match_enhancements?
  # match_ ...
  LIST__Match_Method = LIST__Feature.map do
    ('match_' + _1 + '?').to_sym
  end

=begin
  {
    1 => :add_to_new_features,
    2 => :add_to_enhancements,
    ...
  }
=end
  HASH__Order_To_AddTo_Method = ([1,2,3,4,5,6].zip LIST__Feature.map {|m| ('add_to_' + m).to_sym }).to_h



  def take_action(action)
    options = "nebscd"

=begin
    {
      "-n" => "new_features", "-e" => "enhancements",  "-b" => "bug_fixes",
      "-s" => "security",     "-c" => "compatibility", "-d" => "deprecations"
    }
=end
    action_table = options.chars.map do |op|
      '-' + op
    end.zip(LIST__Feature).to_h

    public_send "add_to_#{action_table[action]}"
  end


  def first_lower_order_category_index(lns_array, category_order)

    o = category_order

    nvi = next_version_index(lns_array)

    while o < LIST__Match_Method.size
      lns_array[0...nvi].each_with_index do
        return _2 if send(LIST__Match_Method[o], _1)
      end
      o += 1
    end

    # Next version above
    return (nvi - 2)
  end


  # A meta function: do the real work other 6 functions delegate
  #
  # This function detect the main category, and then handle the
  # sub category.
  def meta_add_to_a_category(log, main_category_order, category)

    content = get_changelog
    lns = content.lines

    match_unreleased_fail!(lns[2])

    nvi = next_version_index(lns)
    # To find the existing category line
    main_cat_i = lns[0...nvi].each_with_index do
      # Adjust to index of the order table
      break _2 if send(LIST__Match_Method[main_category_order-1], _1)
    end

    #
    # Always update to latest time when making a log
    #
    # We must add a "\n" because every element of the array
    #   is a sentence with a trailing newline, then they can
    #   be 'joined' to a working long string
    #
    lns[2] = UNRELEASED_TITLE + "\n"

    f_l_o_c_i = first_lower_order_category_index(lns, main_category_order)

    if main_cat_i.class != Integer
    ################################################################################
    # The main category not exists
    ################################################################################


      ########################################
      if @sub_category

      # Because the main category not exists,
      #   nor does the sub category
      #
      sub_cat_i = f_l_o_c_i
      to_wr = lns[0...sub_cat_i].join + "### #{category}:\n\n" + "**#{@sub_category}**\n\n" + '  - ' + log + "\n\n"
      File.write(@changelog, to_wr + lns[sub_cat_i..].join)

      puts "chlog: Add log to #{category}/#{@sub_category}"
      return
      end # end of if @sub_category
      ########################################

      # situation: no sub category

      # Not need adjust to the index of the order table
      log_loc = f_l_o_c_i
      puts "chlog: Add '#{category}' category"
      to_wr = lns[0...(log_loc)].join + "### #{category}:\n\n" + '- ' + log + "\n"
      File.write(@changelog, to_wr + lns[log_loc-1..].join)

  else
  ################################################################################
  # The main category exists
  ################################################################################


    ########################################
    if @sub_category

    # from first list item to next main cat
    #   search if sub cat already exists
    sub_cat_i = lns[main_cat_i+2...f_l_o_c_i].each_with_index do
      break _2 if _1 =~ /^\*\*#{@sub_category}\*\*/
    end

    if !sub_cat_i.is_a?(Integer)
    # the sub category not exists

      sub_cat_i = 2 + find_main_category_last_list_item_index(lns,main_cat_i,f_l_o_c_i)
      to_wr = lns[0...sub_cat_i].join + "**#{@sub_category}**\n\n" + '  - ' + log + "\n\n"
      File.write(@changelog, to_wr + lns[sub_cat_i..].join)
    else
    # the sub category exists

      sub_cat_i +=  main_cat_i+2
      to_wr = lns[0..sub_cat_i+1].join + '  - ' + log + "\n"
      File.write(@changelog, to_wr + lns[sub_cat_i+2..].join)
    end

    puts "chlog: Add log to #{category}/#{@sub_category}"
    return
    end # end of if @sub_category
    ########################################



    # situation: no sub category

    to_wr = lns[0..main_cat_i+1].join + '- ' + log + "\n"

    # main category list should be separated with
    # sub category
    if lns[main_cat_i+2] =~ /\*\*.*/
      to_wr += "\n"
    end
    File.write(@changelog, to_wr + lns[main_cat_i+2..].join)
  end

  puts "chlog: Add log to #{category}"
end



  # main category order: 1
  def add_to_new_features
    meta_add_to_a_category(@log, 1, "New features")
  end

  # main category order: 2
  def add_to_enhancements
    meta_add_to_a_category(@log, 2, "Enhancements")
  end

  # main_category_order: 3
  def add_to_bug_fixes
    meta_add_to_a_category(@log, 3, "Bug fixes")
  end

  # main_category_order: 4
  def add_to_security
    meta_add_to_a_category(@log, 4, "Security")
  end

  # main_category_order: 5
  def add_to_compatibility
    meta_add_to_a_category(@log, 5, "Compatibility")
  end

  # The last of order table
  # main_category_order: 6
  def add_to_deprecations
    meta_add_to_a_category(@log, 6, "Deprecations")
  end

  # Release a version
  def release_new_version(ver)
    if ver.nil?
      puts "chlog: No version supplied!"; puts; abort "Use chlog -r <version>!"
    end

    if !ver.downcase.start_with?('v') and ver[0].match? /\d/
      ver = 'v' + ver
    end

    content = get_changelog
    lns = content.lines

    match_unreleased_fail!(lns[2])

    header = <<~EOF
      # Changelog

      ## [Unreleased](#) (#{TODAY})

      <br>

    EOF

    new_version = "## [#{ver}](#) (#{TODAY})\n"
    new_cont = header + new_version + lns[3..].join('')
    File.write(@changelog, new_cont)
    puts "chlog: Release #{ver} in Changelog!" or return true
  end


  # Help user interactively
  def ask_user_category
    category = @highline.choose do |menu|
      menu.index_color  = :rgb_77bbff
      menu.prompt = "What main category?"
      # return number!!! not string!!!
      menu.choices(*LIST__Main_Category)
    end

    option = LIST__Main_Category.index(category)

    if @sub_category.nil?
      sub = @highline.ask "What sub category? [NIL/sub]"
      case sub
      when '' then @sub_category = nil
      else @sub_category = sub end
    end
    return option
  end

end
