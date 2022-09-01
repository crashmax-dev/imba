export interface ITodo {
  userId: number
  id: number
  title: string
  completed: boolean
}

export enum Routes {
  home = '/home',
  about = '/about'
}
