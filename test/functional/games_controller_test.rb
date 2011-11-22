require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    grant_access!
  end
  
  teardown do
    mocha_teardown
  end
  
  test "new" do
    get :new
    
    assert_response :success
    assert assigns(:game)
  end
  
  test "create" do
    Game.any_instance.stubs(:valid?).returns(true)
    
    post :create
    
    assert_redirected_to game_url(assigns(:game))
    assert flash[:notice]
  end
  
  test "create invalid" do
    post :create
    
    assert_template :new
    assert assigns(:game)
  end
  
  test "index" do
    get :index
    
    assert_response :success
    assert_template :index
    assert assigns(:games)
  end
  
  test "edit" do
    game = Factory.create(:game)
    get :edit, :id => game.id
    
    assert_response :success
    assert_template :edit
    assert assigns(:game)
  end
  
  test "update" do
    Game.any_instance.stubs(:valid?).returns(true)
    
    game = Factory.create(:game)
    put :update, :id => game.id
    
    assert_redirected_to game_url(assigns(:game))
    assert flash[:notice]
  end
  
  test "update invalid" do
    game = Factory.create(:game)
    put :update, :id => game.id 
    
    assert_template #:edit
    assert assigns(:game)
  end  
end