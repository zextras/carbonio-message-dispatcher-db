services {
  check {
    tcp      = "127.0.0.1:5432"
    timeout  = "1s"
    interval = "5s"
  }
  connect {
    sidecar_service {
      proxy {
        local_service_address = "127.78.0.103"
      }
    }
  }
  name = "carbonio-chats-messaging-db"
  port = 5432
}
