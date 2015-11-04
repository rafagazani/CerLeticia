require 'test_helper'

class PacientePostsControllerTest < ActionController::TestCase
  setup do
    @paciente_post = paciente_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:paciente_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create paciente_post" do
    assert_difference('PacientePost.count') do
      post :create, paciente_post: { id_paciente: @paciente_post.id_paciente, id_post: @paciente_post.id_post, visualizacoes: @paciente_post.visualizacoes }
    end

    assert_redirected_to paciente_post_path(assigns(:paciente_post))
  end

  test "should show paciente_post" do
    get :show, id: @paciente_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @paciente_post
    assert_response :success
  end

  test "should update paciente_post" do
    patch :update, id: @paciente_post, paciente_post: { id_paciente: @paciente_post.id_paciente, id_post: @paciente_post.id_post, visualizacoes: @paciente_post.visualizacoes }
    assert_redirected_to paciente_post_path(assigns(:paciente_post))
  end

  test "should destroy paciente_post" do
    assert_difference('PacientePost.count', -1) do
      delete :destroy, id: @paciente_post
    end

    assert_redirected_to paciente_posts_path
  end
end
