# ルート
crumb :root do
  link "トップページ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", mypage_users_path
end

# プロフィール
crumb :profile do
  link "プロフィール", edit_user_path
  parent :mypage
end
