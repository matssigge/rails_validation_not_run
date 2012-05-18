require 'test_helper'

class PredictionTest < ActiveSupport::TestCase

  setup do
    @user = User.create!(name: "John")
    @prediction = @user.predictions.build(name: "Foo", predicted_value: 0)
    @prediction.save!
  end

  test "save Prediction directly without name change" do
    prediction_attributes = {id: "#{@prediction.id}", name: "Foo", predicted_value: "foo"}

    result = @prediction.update_attributes(prediction_attributes)
    assert_equal(false, result)
    assert_not_nil(@prediction.errors)
  end

  test "save Prediction through User, with name change" do
    prediction_attributes = {id: "#{@prediction.id}", name: "Bar", predicted_value: "foo"}
    user_attributes = {'predictions_attributes' => {'1' => prediction_attributes}}

    result = @user.update_attributes(user_attributes)
    assert_equal(false, result)
    assert_not_nil(@user.errors)
  end

  # Fails, but should (probably) pass
  test "save Prediction through User, without name change" do
    prediction_attributes = {id: "#{@prediction.id}", predicted_value: "foo"}
    user_attributes = {'predictions_attributes' => {'1' => prediction_attributes}}

    result = @user.update_attributes(user_attributes)
    assert_equal(false, result)
    assert_not_nil(@user.errors)
  end

end
