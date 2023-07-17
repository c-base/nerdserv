locals {
  users = {
    hrmny = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEDtuIourWzbibkXqsJYk8IHxl4SIvxmnttrlUALu8XS hrmny@c-base.org"
    }
    saces = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL5JruwHRLLVW1LDcoUymftOgqt6I2khSvvSnNLk7XZ4 saces@c-base.org"
    }
    kristall = {
      ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCGtWx38XaxP6fbU3lWmUnwC05jikgLYoBvYskpGQtEfkI+ChH6w9tjOTUbxAggROpKcBDduqrY6PWufdSwsIbk5F5WeJzymFosDGa3GFErBa557kiru+PnfHWcQ+X//Xj1Hpc/jwAYFR1YrEAANPNAN5Gg2bVsB7yWTqNrIrInqGktWruZXXfQ9UEfdO0tQ5kwWvzKsdniHm1BUoHgr3zuWXOA3vPDRWwnZbbbQECUSf/t9IGPVFkcAEQv9MqcQCrTOFaHiP7mcep0FlMRZPsg0oH6eGTZhBpGwWZIdglTTvCXeXzsqU7znTFqwdzwY1vN1GrrhPokkFiEzWEAUgXeBDll7qDU1ztQqn7AnO2/AhBeqvRBz79z2g7tlk+Xm4SL6eljp9ZJ8KugMWmaSIekxqFxBkqpn0ZFeJit3Y92k81WUCPshoUQrx713akbqrBT3ZTmPQRpVG+x4Wv3JymUukEoSPIOaIgVav8gYJpjvoS6XzS0S8iQBohKSKZoXQddmWTxIzAL86nU0U4Ms12e+McKuJ8OS2fbicbIb8FS4h1z8O/zRL7BEmzvsQQEcJ8cJRm1NvKZ4B2Y3O1QNBHaGzcWwJuS0I7SLPS+9hvYiRo8u1aJZlmWPvFlm01zsoRjRZ10yPe5N+pZahZRu03pInNXIq6owqgvpdPfPc5IBw== kristall@c-base.org"
    }
  }

  node = "nerdserv"
  pool = "terraform"

  network = {
    bridge = "vmbr0"
  }

  storage = {
    disk     = "data"
    template = "local"
    snippets = "config"
  }
}
