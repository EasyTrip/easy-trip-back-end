# frozen_string_literal: true

module GraphqlRequestHelpers
  def valid_gql_request(query, user, headers: {})
    headers = headers.merge(valid_headers(user))
    gql_request(query, headers: headers)
  end

  def gql_request(query, variables: nil, operation_name: nil, headers: nil)
    params = { query: query, variables: variables, operationName: operation_name }.compact
    post '/graphql', params: params, headers: headers
  end

  def json
    JSON.parse(response.body).with_indifferent_access
  end

  def valid_headers(user)
    exp = Authentication::EmailSignInService::EXPIRATION_DAYS.days.from_now.to_i
    jwt = JsonWebToken.encode(user_id: user.id, exp: exp)
    { 'Authorization' => "Bearer #{jwt}" }
  end
end
