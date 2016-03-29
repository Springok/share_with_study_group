require 'minitest/autorun'
require_relative '../version'


class VersionTest < MiniTest::Unit::TestCase
  def setup
    @v1 = Version.new("2.1.1")
    @v2 = Version.new("2.3.0")
  end

  def test_version_compare
    refute_equal @v1, @v2
    assert_operator @v1, :<, @v2
  end

  def test_major_number
    v = Version.new("2.1.3")
    assert v.major == 2, "major should be 2"
  end

  def test_can_perse_version_string
    v = Version.new("2.1.3")
    assert_equal 2, v.major, "major"
    assert_equal 1, v.minor, "minor"
    assert_equal 3, v.patch, "patch"
  end

  # def test_force_assertion_failure
  #   v = Version.new("3.8.11")
  #   assert_equal 4, v.major, "parsing major"
  # end

end
