namespace: GenericActivities
operation:
  name: KeyVault_Access
  python_action:
    use_jython: false
    script: "def execute():\n    import os\n    from azure.identity import ClientSecretCredential\n    from azure.keyvault.secrets import SecretClient\n    \n    ClientID = 'a7e41e17-18cf-4fd3-9dbb-d1322ad23e3f'\n    TenantID = '8c9b06d0-cb4a-4a03-b449-1f5a2548a910'\n    ClientSecret = 'Ao3l_06~Df_q3W.kIl9woUVC8Xlc3A_Ys9'\n    KeyVaultName = 'sapn-rpa-prd-ae-kv'\n    SecretName = 'testsecret'\n    KeyVault_URI = f\"https://{KeyVaultName}.vault.azure.net/\"\n    \n    _credential = ClientSecretCredential(tenant_id=TenantID,client_id=ClientID,client_secret=ClientSecret)\n    \n    _sc = SecretClient(vault_url=KeyVault_URI, credential=_credential)\n    demo_azure_secret = _sc.get_secret(SecretName).value\n    return{\"demo_azure_secret\":demo_azure_secret}"
  outputs:
    - demo_azure_secret
  results:
    - SUCCESS
