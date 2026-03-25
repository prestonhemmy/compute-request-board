require "test_helper"

class ComputeRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @compute_request = compute_requests(:one)
  end

  test "should get index" do
    get compute_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_compute_request_url
    assert_response :success
  end

  test "should create compute_request" do
    assert_difference("ComputeRequest.count") do
      post compute_requests_url, params: { compute_request: { cpu_count: @compute_request.cpu_count, created_at: @compute_request.created_at, gpu_count: @compute_request.gpu_count, hours: @compute_request.hours, memory_gb: @compute_request.memory_gb, notes: @compute_request.notes, partition: @compute_request.partition, priority: @compute_request.priority, status: @compute_request.status, title: @compute_request.title, updated_at: @compute_request.updated_at } }
    end

    assert_redirected_to compute_request_url(ComputeRequest.last)
  end

  test "should show compute_request" do
    get compute_request_url(@compute_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_compute_request_url(@compute_request)
    assert_response :success
  end

  test "should update compute_request" do
    patch compute_request_url(@compute_request), params: { compute_request: { cpu_count: @compute_request.cpu_count, created_at: @compute_request.created_at, gpu_count: @compute_request.gpu_count, hours: @compute_request.hours, memory_gb: @compute_request.memory_gb, notes: @compute_request.notes, partition: @compute_request.partition, priority: @compute_request.priority, status: @compute_request.status, title: @compute_request.title, updated_at: @compute_request.updated_at } }
    assert_redirected_to compute_request_url(@compute_request)
  end

  test "should destroy compute_request" do
    assert_difference("ComputeRequest.count", -1) do
      delete compute_request_url(@compute_request)
    end

    assert_redirected_to compute_requests_url
  end
end
