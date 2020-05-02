require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
        # Railsは自動的にはてなマーク "?" をabout_pathに置換しています (このとき "about_path" 内に特殊記号があればエスケープ処理されます)。
    # また、count: 2 と指定することでリンクの個数を示している
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end