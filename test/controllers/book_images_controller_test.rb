require 'test_helper'

class BookImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get book_images_new_url
    assert_response :success
  end

  test "should get create" do
    get book_images_create_url
    assert_response :success
  end

  test "should get index" do
    get book_images_index_url
    assert_response :success
  end

  test "should get show" do
    get book_images_show_url
    assert_response :success
  end

end
