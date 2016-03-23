package controllers

import play.api.mvc._

object Fibaas extends Controller {
  def fib(n: Int): Int = n match {
    case 0 | 1 => n
    case _ => fib(n - 1) + fib(n - 2)
  }

  def route(number: Int) = Action {
    Ok(fib(number).toString)
  }
}
