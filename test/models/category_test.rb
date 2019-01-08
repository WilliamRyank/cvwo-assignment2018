class CategoryTest < ActiveSupport::TestCase

  test "validity of category" do
    @category = Category.create(name: "sports")
    assert @category.valid?
  end

end
