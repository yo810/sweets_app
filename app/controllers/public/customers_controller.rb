class Public::CustomersController < ApplicationController

  # 会員詳細画面
  def show
    @customer = current_customer
  end

  # 会員登録の編集画面
  def edit
    @customer = current_customer
  end

  # 退会ページ
  def unsubscribe
    @customer = current_customer
  end

  # 退会アクション
  def widhdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:alert] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  # 会員情報編集のアクション
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to public_customers_my_page_path
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
