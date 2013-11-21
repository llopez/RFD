require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "title must be present" do
    @place = Place.new
    assert_not @place.valid?
    assert_includes @place.errors[:title], "can't be blank"
  end

  test "description must be present" do
    @place = Place.new
    assert_not @place.valid?
    assert_includes @place.errors[:description], "can't be blank"
  end

  test "address is not required" do
    @place = Place.new
    assert_not @place.valid?
    assert_empty @place.errors[:address]
  end
  
  test "valid place" do
    @place = Place.new title: 'title', description: 'description'
    assert @place.valid?
    assert_empty @place.errors[:title]
    assert_empty @place.errors[:description]
    assert_empty @place.errors[:address]
  end
end
