require "rails_helper"

RSpec.describe Repositories::PostRepo do
  describe "#create" do
    subject(:create) { described_class.new.create(attrs:) }

    context "user exists" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:user_id) { user.id }

      context "when valid attrs are passed" do
        let(:attrs) do
          {
            user_id: user.id
          }
        end

        it "creates post" do
          expect { create }.to change { Post.count }.by(1)
        end
      end
    end

    context "user does not exists" do
      context "when valid attrs are passed" do
        let(:attrs) do
          {
            user_id: "test"
          }
        end

        it "return record invalid" do
          expect { create }.to raise_error(ActiveRecord::RecordInvalid)
        end
      end
    end
  end
end
