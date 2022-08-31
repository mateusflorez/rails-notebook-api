require 'rails_helper'

describe V1::ContactsController, type: :controller do
  it 'request index returns 406 NOT ACCEPTABLE' do
    get :index
    expect(response.status).to eql(406)
  end

  it 'request index returns 200 OK' do
    request.accept = 'application/vnd.api+json'
    get :index
    expect(response.status).to eql(200)
  end

#  it 'GET /contacts/:id' do
#    contact = Contact.first
#
#    request.accept = 'application/vnd.api+json'
#    get :show, params: contact.id
#
#    response_body = JSON.parse(response.body)
#
#    expect(response_body.fetch('data').fetch('id')).to eq(contact.id)
#  end
end
