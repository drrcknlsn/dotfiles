vim.filetype.add({
  extension = {
    neon = 'yaml',
  },
  filename = {
    ['composer.lock'] = 'json',
  },
  pattern = {
    ['.*/.env.*'] = 'sh',
    --['.*/*.blade.php'] = 'blade',
  },
})
