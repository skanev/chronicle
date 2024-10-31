import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['template', 'list', 'item']
  static classes = ['removed']

  initialize() {
    this.nextIndex =
      [...this.listTarget.querySelectorAll('input[type="hidden"]')].
        map(input => Number(input.name.replace(/^\w+\[\w+\]\[(\d+)].*$/, '$1'))).
        reduce((acc, val) => Math.max(acc, val), 0) + 1
  }

  connect() {
  }

  add() {
    const index = this.nextIndex++

    const markup = this.templateTarget.innerHTML.
      replace(/(name="\w+\[\w+_attributes\])\[0\]/g, `$1[${index}]`).
      replace(/(id="[a-z]+_[a-z]+_attributes)_0/g, `$1_${index}]`)

    this.listTarget.insertAdjacentHTML('beforeend', markup)
  }

  remove(event) {
    const wrapper = event.target.closest('[data-nested-attributes-target=item]')
    const destroyInput = wrapper.querySelector('input[name*="[_destroy]"]')

    if (destroyInput) {
      destroyInput.value = '1'
      wrapper.classList.add(this.removedClass)
    } else {
      wrapper.remove()
    }
  }
}
