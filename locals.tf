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
    uk = {
      ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAgEAv7oiARyDwODSIDc+vd5mm6i+081S2JicAJTTDXzRrapNjiCKlZU8twNUiSrvnuL+RMobM4ybHwv0ooib785Ai9TT/Mh4pGIa2NLJbs4cRJFmeDHpoIbLPlNFaffU9vMk9oQBd9+GZdhml0x/z5o6mTmI2qjzfklvo7eKkrJ/ytLIWSBqX6R77uX5D+5gGWi2TYsZcEgq1pYspE3KZrHzxwFWOF1+PL6zsMiKm/oVsWBQk6Y28E66cG5mpB07FDWTeoMqP23poCyom7Mzg2P7FUtsepLoBfLW5JEu8Ti4vCNfoeA10dS1lr6VlMenUqnM/f51DzCbVM4fx0Sn/zXE0aWxhGxInXjwPOdrhiOMCY+bGeTqs+kaP9eJlrP/ZlG2JDTlc2P9wJSbZAPl0LpQuL/sOBPbUiGHiyRFnV5LLEgSLH1xhEsvqIXYrLJNgaRpVJBHZpO1GB0vTbnwRVaB6kDbjiahOhz5DX9wAM/eyenYSmbpvJ6fxb6bHRRtuwx//qpH5CN/Owp7+fjYk6X8KzB2kxD4cjbE4ZDQwwQABYoAQIj6kpBb3MlYNy4FipTHy+cNd0HCE+pxyUWziyG9T/sZmBCpOQ3wifDmtsc2t5TlbcQvFuklwpEoQxyGNkHtD4fB60y+Yhvco5rAwps2FRlV2iloPqVwJp0bQ9/KEsU= uwekamper@birne.lan"
    }
    mecci = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILFaAXNhs2IkZQd059lPM+3h03siLRBJRBD8ouiAxsvL mecci@c-base.org"
    }
    phelix = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINeEBqbuKi5aOXwVEaEVCEPE8g1g1su+FxSPPswmEFaw phelix@c-base.org"
    }
    prom = {
      ssh_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKsQxpdeVl1ljSl4wIdMQ5pUBMXJybINOVBTb4hweGsf prom@c-base.org"
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
