import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["productsContainer"]

  sort(event) {
    const sortValue = event.target.value
    const container = this.productsContainerTarget
    const cards = Array.from(container.children)

    let sortedCards = [...cards]

    if (sortValue === 'price-asc') {
      sortedCards.sort((a, b) => parseFloat(a.dataset.price) - parseFloat(b.dataset.price))
    } else if (sortValue === 'price-desc') {
      sortedCards.sort((a, b) => parseFloat(b.dataset.price) - parseFloat(a.dataset.price))
    } else if (sortValue === 'name-asc') {
      sortedCards.sort((a, b) => a.dataset.name.localeCompare(b.dataset.name))
    } else if (sortValue === 'name-desc') {
      sortedCards.sort((a, b) => b.dataset.name.localeCompare(a.dataset.name))
    }

    container.innerHTML = ''
    sortedCards.forEach(card => container.appendChild(card))
  }
}

