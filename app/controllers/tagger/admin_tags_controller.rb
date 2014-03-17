module Tagger
  class AdminTagsController < Admin::AdminController
    def show
      tags = Tag.all.order(:title)
      render json: tags.to_json
    end

    def create
      tag = Tag.new
      tag.update(tag_params)
      tag.save!
      render json: tag.to_json
    end

    def update
      tag = find_tag
      tag.update(tag_params)
      tag.save!
      render json: tag.to_json
    end

    def destroy
      find_tag.destroy
      render nothing: true
    end

    private
      def find_tag
        params.require(:id)
        Tag.find(params[:id])
      end

      def tag_params()
        params.permit(:title)
      end
  end
end