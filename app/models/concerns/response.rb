module Response
  def json_response(object, status = :ok, include_fields = [], except_fields = [])
    render json: object, status: status, include: include_fields, except: except_fields
  end
end