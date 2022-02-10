document.addEventListener('turbolinks:load', () => {
  const modal = document.getElementById('modal')
  const modalInner = modal.querySelector('.modal-inner')
  const modalCloseBtn = modal.querySelector('.close-btn')
  const bodyDocument = document.querySelector('body')

  modalCloseBtn.addEventListener('click', () => {
    modal.classList.replace('block', 'hidden')
    modalInner.innerHTML = ''
    bodyDocument.classList.remove('overflow-hidden')
  })
})