on_app_servers do
  sudo "monit restart all -g frm_sidekiq"
end
