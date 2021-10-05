class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #1.データを新規登録するためのインスタンス作成
    list = List.new(list_params)
    #2.データをデータベースに保存するためのsaveメゾット実行
    list.save
    #トップ画面へリダイレクト
    redirect_to '/top'
  end

  private
  #ストロングパラメーター
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
