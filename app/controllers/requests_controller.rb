class RequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @requests = Request.order(created_at: :desc)
  end

  def show
    @request = Request.find(params[:id])
  end

  def create
    Request.create(
      method: request.method,
      headers: headers,
      body: body
    )
    head :ok
  end

  private

  def headers
    built_headers = {}
    relevant_keys.each do |key|
      built_headers[key] = request.headers[key]
    end
    built_headers
  end

  def relevant_keys
    request.headers.env.keys.select do |key|
      key.include?("CONTENT") || key.include?("HTTP")
    end
  end

  def body
    JSON.parse(request.env["RAW_POST_DATA"])
  end
end