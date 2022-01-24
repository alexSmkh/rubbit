document.addEventListener('turbolinks:load', () => {
  const CONTENT_TYPES = {
    files: 'files',
    link: 'link',
    text: 'text',
  }
  
  const submissionTabs = document.getElementById('submission-form-tabs')
  const tabs = submissionTabs.querySelectorAll('.tab')
  const contents = document.querySelectorAll('[data-content]')
  const contentsArr = Array.from(contents)
  const link_container = contentsArr.find((element) => element.dataset.content === CONTENT_TYPES.link)
  const files_container = contentsArr.find(
    (element) => element.dataset.content === CONTENT_TYPES.files
  )
  
  if (!!link_container || !!files_container) {
    link_container.classList.add('hidden')
    files_container.classList.add('hidden')
  }

  const showContent = (contentType) => {
    contents.forEach((content) => {
      if (content.dataset.content === contentType) {
        content.classList.remove('hidden')
      } else {
        content.classList.add('hidden')
      }
    })
  }

  const toggleTabs = (activeTab) => {
    tabs.forEach((tab) => {
      tab.dataset.tab === activeTab ? tab.classList.add('tab-active') : tab.classList.remove('tab-active')
    })
  }

  const handleTabClick = (event) => {
    const clickedTabType = event.currentTarget.dataset.tab
    if (event.currentTarget.classList.contains('tab-active')) return
    

    toggleTabs(clickedTabType)
    showContent(clickedTabType)
  }

  tabs.forEach((tab) => tab.addEventListener('click', handleTabClick))
})
