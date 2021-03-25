class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all
    end

    def show
        @blogger = Blogger.find(params[:id])
        @likes = 0
        @sorted = @blogger.posts.sort_by{|object| object.likes }
    end

    def new
        @blogger = Blogger.new
    end

    def create
        # byebug
        @blogger = Blogger.create(blogger_params)
        # @blogger.save
        redirect_to @blogger
    end

    def blogger_params
        params.require(:blogger).permit(:name, :bio, :age)
    end

end
