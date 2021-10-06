class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #1.データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    list.save
    #詳細画面へリダイレクト
    redirect_to todolist_path(list.id)

  end

  def index
    @lists  = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
