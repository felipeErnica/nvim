local jdtls = require("jdtls")

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.workspace = {
  configuration = true,
  didChangeWatchedFiles = {
    dynamicRegistration = true
  },
  didChangeConfiguration = {
    dynamicRegistration = true
  }
}

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'Gd', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', '<space>K', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>o', function () require("jdtls").organize_imports() end, bufopts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<space>fo', vim.lsp.buf.format, bufopts)
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '<leader>xp', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', '<leader>xn', vim.diagnostic.goto_next, opts)
end

local config = {
    flags = {
        allow_incremental_sync = true
    },
    cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls"},

    root_dir = require("jdtls.setup").find_root({ 'gradlew', '.git', 'mvnw' }),
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            sources = {
                organizeImports = {
                    starThreshold = 9999,
                    staticStarThreshold = 9999,
                },
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
                },
                hashCodeEquals = {
                    useJava7Objects = true,
                },
                useBlocks = true,
            },
        }
    },


    init_options = {
        bundles = vim.fn.glob(vim.env.HOME .. '/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar'),
    }
}

local cmp = require('cmp');

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert({
    ['C-Space'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  }),
})

config["on-attach"] = function(client, bufnr)
    jdtls.setup_dap({ hotcodereplace = 'auto'})
    require("jdtls.dap").setup_dap_main_class_configs()
end

require('jdtls').start_or_attach(config)
