# frozen_string_literal: true

describe Mutations::Expenses::UpdateExpenseMutation, type: :request do
  let(:mutation) do
    <<~GQL
      mutation {
        updateExpense(id: #{expense.id},
                      name: "#{new_name}",
                      description: "#{new_description}",
                      price: #{new_price},
                      priceCurrency: "#{new_price_currency}") {
          id
          name
          description
          price
          priceCurrency
        }
      }
    GQL
  end

  let(:user) { expense.trip.creator }
  let!(:expense) { create(:expense) }

  describe '#resolve' do
    subject(:request) { valid_gql_request(mutation, user) }

    let(:new_name) { "#{expense.name}-2" }
    let(:new_description) { "#{expense.description}-2" }
    let(:new_price) { expense.price / 25 }
    let(:new_price_currency) { 'USD' }

    context 'when user is authenticated' do
      it 'changes name' do
        expect { request }.to change { expense.reload.name }.from(expense.name).to(new_name)
      end

      it 'changes description' do
        expect { request }
          .to change { expense.reload.description }.from(expense.description).to(new_description)
      end

      it 'changes price' do
        expect { request }
          .to change { expense.reload.price.to_s }.from(expense.price.to_s).to(new_price.to_s)
      end

      it 'changes price_currency' do
        expect { request }.to change { expense.reload.price_currency }
          .from(expense.price_currency).to(new_price_currency)
      end

      it 'returns changed expense' do
        request
        expect(json[:data][:updateExpense]).to include(id: expense.id.to_s,
                                                       name: new_name,
                                                       description: new_description,
                                                       price: new_price.to_s,
                                                       priceCurrency: new_price_currency)
      end
    end

    context 'when user is guest' do
      subject(:request) { gql_request(mutation) }

      it 'does not change expense' do
        expect { request }.not_to(change { expense.reload.attributes })
      end

      include_examples 'when user is guest' do
        let(:query) { mutation }
      end
    end
  end
end
