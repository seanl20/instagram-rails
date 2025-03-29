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

  describe "#get" do
    subject(:get) { described_class.new.get(id:) }

    context "post exists" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:post) { FactoryBot.create(:post, user:) }
      let!(:id) { post.id }

      it "creates post" do
        expect(get).to eq(post)
      end
    end

    context "post does not exists" do
      let!(:id) { nil }

      it "return record invalid" do
        expect { get }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#update" do
    subject(:update) { described_class.new.update(id:, attrs:) }

    context "post exists" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:post) { FactoryBot.create(:post, user:) }
      let!(:id) { post.id }

      context "when valid attrs are passed" do
        let(:attrs) do
          {
            x_offset: 200,
            y_offset: 200,
            width: 400,
            height: 400
          }
        end

        it "updates post" do
          update
          expect(post.reload.x_offset).to eq(200)
          expect(post.reload.y_offset).to eq(200)
          expect(post.reload.width).to eq(400)
          expect(post.reload.height).to eq(400)
        end
      end
    end

    context "post does not exists" do
      let!(:id) { 1 }

      context "when valid attrs are passed" do
        let(:attrs) do
          {
            x_offset: 200,
            y_offset: 200,
            width: 400,
            height: 400
          }
        end

        it "return record not found" do
          expect { update }.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end
  end
end
