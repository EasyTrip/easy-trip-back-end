# frozen_string_literal: true

module GraphqlRequestHelpers
  def valid_gql_request(query, user, headers: {})
    headers = headers.merge(valid_headers(user))
    gql_request(query, headers: headers)
  end

  def gql_request(query, headers: nil)
    post '/graphql', params: { query: query }, headers: headers
  end

  def json
    JSON.parse(response.body).with_indifferent_access
  end

  private

  def valid_headers(user)
    exp = Authentication::EmailSignIn::EXPIRATION_DAYS.days.from_now.to_i
    jwt = JsonWebToken.encode(user_id: user.id, exp: exp)
    { 'Authorization' => "Bearer #{jwt}" }
  end
end
