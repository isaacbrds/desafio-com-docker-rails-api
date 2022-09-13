#<Encoding:UTF-8>

require 'rails_helper'
require 'time'
RSpec.describe "V1::Lectures", type: :request do
  context "GET /lectures" do
    let(:url) { "/api/v1/lectures" }
    let!(:lectures) { create_list(:lecture, 5) }
  
    it "returns all Lectures" do
      get url
      expect(body_json['lectures']).to contain_exactly *lectures.as_json(only: %i(id title))
    end

    it "returns success status" do
      get url
      expect(response).to have_http_status(:ok)
    end
  end

  context "POST /lectures" do
    let(:url) { "/api/v1/lectures" }
    
    context "with valid params" do
      let(:session) {create(:session)}
      let(:lecture) { attributes_for(:lecture, session_id: session.id) }
      
      before do
        post url, params: {lecture: lecture}
      end
      
      
      it "has not error message" do
        expect(body_json['lecture']['errors']).to be_blank
      end
        
      it 'returns last added Lecture' do
        expected_lecture = Lecture.last.as_json(except: %i(created_at updated_at))
        expect(body_json['lecture']).to eq expected_lecture
      end
      
      it 'returns success status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:lecture_invalid_params) do 
        { lecture: attributes_for(:lecture, title: nil) }
      end
    
      it 'does not add a new lecture' do
        expect do
          post url, params: lecture_invalid_params
        end.to_not change(Lecture, :count)
      end

      it 'returns unprocessable_entity status' do
        post url, params: lecture_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
    
  end

  context "PATCH /lectures/:id" do
    let(:lecture) { create(:lecture) }
    let(:url) { "/api/v1/lectures/#{lecture.id}" }
    context "with valid params" do
      let(:new_title) { 'My new title' }
      let(:lecture_params)  { { lecture: { title: new_title } } }

      before do
        patch url, params: lecture_params
      end

      it 'updates Lecture' do
        lecture.reload
        expect(lecture.title).to eq new_title
      end

      it 'returns last added Lecture' do
        lecture.reload
        expected_lecture = Lecture.last.as_json(except: %i(created_at updated_at))
        expect(body_json['lecture']).to eq expected_lecture
      end

      it 'returns success status' do
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid params" do
      let(:lecture_invalid_params) do 
        { lecture: attributes_for(:lecture, title: nil) }
      end
  
      it 'does not update lecture' do
        old_title = lecture.title
        patch url, params: lecture_invalid_params
        lecture.reload
        expect(lecture.title).to eq old_title
      end

      it 'returns unprocessable_entity status' do
        patch url, params: lecture_invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  context "GET /lectures/:id" do
    let!(:lecture) { create(:lecture) }
    let(:url) { "/api/v1/lectures/#{lecture.id}" }

    it 'returns success status' do
      get url
      expect(response).to have_http_status(:ok)
    end

    it 'returns body content' do
      get url
      expect(body_json).to be_present
    end
  end

  context "DELETE /lectures/:id" do
    let!(:lecture) { create(:lecture) }
    let(:url) { "/api/v1/lectures/#{lecture.id}" }

    it 'removes lecture' do
      expect do  
        delete url
      end.to change(Lecture, :count).by(-1)
    end

    it 'returns success status' do
      delete url
      expect(response).to have_http_status(:no_content)
    end

    it 'does not return any body content' do
      delete url
      expect(body_json).to_not be_present
    end
  end
end
