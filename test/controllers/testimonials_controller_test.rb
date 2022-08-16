require "test_helper"

class TestimonialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testimonial = testimonials(:one)
  end

  test "should get index" do
    get testimonials_url, as: :json
    assert_response :success
  end

  test "should create testimonial" do
    assert_difference("Testimonial.count") do
      post testimonials_url, params: { testimonial: { loteria: @testimonial.loteria, msg: @testimonial.msg, name: @testimonial.name, points: @testimonial.points, receipt: @testimonial.receipt } }, as: :json
    end

    assert_response :created
  end

  test "should show testimonial" do
    get testimonial_url(@testimonial), as: :json
    assert_response :success
  end

  test "should update testimonial" do
    patch testimonial_url(@testimonial), params: { testimonial: { loteria: @testimonial.loteria, msg: @testimonial.msg, name: @testimonial.name, points: @testimonial.points, receipt: @testimonial.receipt } }, as: :json
    assert_response :success
  end

  test "should destroy testimonial" do
    assert_difference("Testimonial.count", -1) do
      delete testimonial_url(@testimonial), as: :json
    end

    assert_response :no_content
  end
end
