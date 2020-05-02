# モジュールは、関連したメソッドをまとめる方法の１つで、includeメソッドを使ってモジュールを読み込むことができます (ミックスイン (mixed in) とも呼びます)
# ただ、Railsフレームワークは、自動的にヘルパーモジュールを読み込んでくれるので読み手側は、わざわざこのmoduleを使うためのinclude文を書く必要がないですあ
module ApplicationHelper
  

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end