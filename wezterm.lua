local Config = require('config')

-- see https://github.com/Sokyoei/data
local data_dir = os.getenv('SOKYOEI_DATA_DIR')
if data_dir and data_dir ~= '' then
   require('utils.backdrops'):set_images_dir(data_dir .. '/Ahri/')
end

require('utils.backdrops')
   -- :set_focus('#000000')
   :set_images()
   :random()

require('events.left-status').setup()
require('events.right-status').setup({ date_format = '%a %H:%M:%S' })
require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'numbered_box' })
require('events.new-tab-button').setup()
require('events.gui-startup').setup()

return Config:init()
   :append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options
