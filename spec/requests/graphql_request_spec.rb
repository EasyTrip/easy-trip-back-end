# frozen_string_literal: true

Rspec.describe GraphqlController, type: :request do
  subject(:request) do
    gql_request(query,
                variables: variables&.to_json,
                operation_name: operation_name,
                headers: headers)
  end

  context 'when request is valid' do
    context 'with variables' do
      let(:query) do
        <<~GQL
          query getTrip($id: ID!) {
          	trip(id: $id) {
          		id
          	}
          }
        GQL
      end

      let(:operation_name) { 'getTrip' }
      let(:variables) { { id: trip.id }.stringify_keys }
      let(:trip) { create(:trip) }
      let(:user) { trip.creator }
      let(:headers) { valid_headers(user) }

      it 'calls EasyTripBackEndSchema with correct parameters' do
        expect(EasyTripBackEndSchema).to receive(:execute).with(
          query,
          variables: variables,
          operation_name: operation_name,
          context: { current_user: user, pundit: kind_of(described_class) }
        )
        request
      end
    end

    context 'without variables' do
      let(:query) do
        <<~GQL
          query getTrips {
          	trips {
          		id
          	}
          }
        GQL
      end

      let(:operation_name) { 'getTrips' }
      let(:variables) { nil }
      let(:trip) { create(:trip) }
      let(:user) { trip.creator }
      let(:headers) { valid_headers(user) }

      it 'calls EasyTripBackEndSchema with correct parameters' do
        expect(EasyTripBackEndSchema).to receive(:execute).with(
          query,
          variables: {},
          operation_name: operation_name,
          context: { current_user: user, pundit: kind_of(described_class) }
        )
        request
      end
    end
  end

  context 'when request is not valid' do
    let(:query) do
      <<~GQL
        query getTrips {
        	trips {
        		id
        	}
        }
      GQL
    end

    let(:operation_name) { 'getTrips' }
    let(:variables) { [] }

    context 'when environment is test' do
      it 'raises argument error' do
        expect { request }.to raise_error ArgumentError, 'Unexpected parameter: []'
      end
    end

    context 'when environment is development' do
      before { allow(Rails.env).to receive(:development?).and_return(true) }

      it 'responds with 500 status code' do
        request
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end
end
