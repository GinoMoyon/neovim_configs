type User = {
  id: number
  name: string
}

function outer(a: number, b: number) {
  if (a > 0) {
    const user: User = { id: a, name: "Gino" }

    const inner = (x: number) => {
      return x + user.id + b
    }

    return inner(a)
  }

  return 0
}

class Greeter {
  constructor(private prefix: string) {}

  greet(name: string) {
    return `${this.prefix}, ${name}`
  }
}
