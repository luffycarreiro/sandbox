searchNodes=[{"doc":"Context for accounts","ref":"Sandbox.Accounts.html","title":"Sandbox.Accounts","type":"module"},{"doc":"Account detail.","ref":"Sandbox.Accounts.html#detail/2","title":"Sandbox.Accounts.detail/2","type":"function"},{"doc":"Returns one account.","ref":"Sandbox.Accounts.html#get_account/2","title":"Sandbox.Accounts.get_account/2","type":"function"},{"doc":"Transforms the token into list of accounts ids.","ref":"Sandbox.Accounts.html#get_accounts_from_token/1","title":"Sandbox.Accounts.get_accounts_from_token/1","type":"function"},{"doc":"List accounts. Depending on the provided token between returns between 1 and 8 accounts. It will return the same data if the same token is passed. Here 2 kind of hashing algorithms are used. :erlang.phash2() Very usefull for getting an integer from any string. :crypto.hash(:md5, _) Used for calculating ID's.","ref":"Sandbox.Accounts.html#list_accounts/1","title":"Sandbox.Accounts.list_accounts/1","type":"function"},{"doc":"Hashes the token n times for different results","ref":"Sandbox.Accounts.html#transform_token_into_account/2","title":"Sandbox.Accounts.transform_token_into_account/2","type":"function"},{"doc":"Module that wrapps DateTime so I can mock it easily. (for testing porpouses)","ref":"Sandbox.MyDateTime.html","title":"Sandbox.MyDateTime","type":"module"},{"doc":"","ref":"Sandbox.MyDateTime.html#utc_now/0","title":"Sandbox.MyDateTime.utc_now/0","type":"function"},{"doc":"Context for transactions","ref":"Sandbox.Transactions.html","title":"Sandbox.Transactions","type":"module"},{"doc":"","ref":"Sandbox.Transactions.html#filter_transactions/4","title":"Sandbox.Transactions.filter_transactions/4","type":"function"},{"doc":"Gets accounts balance","ref":"Sandbox.Transactions.html#get_balance/2","title":"Sandbox.Transactions.get_balance/2","type":"function"},{"doc":"Returns a transaciont by ID","ref":"Sandbox.Transactions.html#get_transaction/3","title":"Sandbox.Transactions.get_transaction/3","type":"function"},{"doc":"List all transactions. Transactions are calculated from the end of the yeary to 90 days before today. So transactions are consistent within a year, it starts calculating transactions from a start balance and adds from 0 to 5 transactions per day. Transactions are calculated as an Integer and divided by 100 so we don't have the problem of Float calculations. Every transactions is calculated using :erlang.phash2(), which hashses any string and returns an Integer. Transactions could be filtered using using from_id and count from id will show the next transaction after that id and it will return the number of transactions by count.","ref":"Sandbox.Transactions.html#list_transactions/2","title":"Sandbox.Transactions.list_transactions/2","type":"function"},{"doc":"Utils for contexts","ref":"Sandbox.Utils.html","title":"Sandbox.Utils","type":"module"},{"doc":"Controller in charge of authentication for the api.","ref":"SandboxWeb.AuthController.html","title":"SandboxWeb.AuthController","type":"module"},{"doc":"Authenticates the the token has to be test string after test the token must not have any special chars like . Also adds the accounts into the socket. Even though I don't like to do many things on the same function it seems apropiate as accounts are going to be need it every single request.","ref":"SandboxWeb.AuthController.html#get_accounts_from_auth_token/2","title":"SandboxWeb.AuthController.get_accounts_from_auth_token/2","type":"function"},{"doc":"Live view for painting on a graph the number of times an account endpoint it is used. We subscribe to a topic called sandbox_chart and sent to it a broadcast.","ref":"SandboxWeb.ChartLive.html","title":"SandboxWeb.ChartLive","type":"module"},{"doc":"Module with named helpers generated from SandboxWeb.Router.","ref":"SandboxWeb.Router.Helpers.html","title":"SandboxWeb.Router.Helpers","type":"module"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_path/2","title":"SandboxWeb.Router.Helpers.account_path/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_path/3","title":"SandboxWeb.Router.Helpers.account_path/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_path/4","title":"SandboxWeb.Router.Helpers.account_path/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_url/2","title":"SandboxWeb.Router.Helpers.account_url/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_url/3","title":"SandboxWeb.Router.Helpers.account_url/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#account_url/4","title":"SandboxWeb.Router.Helpers.account_url/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#docs_path/2","title":"SandboxWeb.Router.Helpers.docs_path/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#docs_path/3","title":"SandboxWeb.Router.Helpers.docs_path/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#docs_url/2","title":"SandboxWeb.Router.Helpers.docs_url/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#docs_url/3","title":"SandboxWeb.Router.Helpers.docs_url/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_path/2","title":"SandboxWeb.Router.Helpers.live_dashboard_path/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_path/3","title":"SandboxWeb.Router.Helpers.live_dashboard_path/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_path/4","title":"SandboxWeb.Router.Helpers.live_dashboard_path/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_path/5","title":"SandboxWeb.Router.Helpers.live_dashboard_path/5","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_url/2","title":"SandboxWeb.Router.Helpers.live_dashboard_url/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_url/3","title":"SandboxWeb.Router.Helpers.live_dashboard_url/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_url/4","title":"SandboxWeb.Router.Helpers.live_dashboard_url/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_dashboard_url/5","title":"SandboxWeb.Router.Helpers.live_dashboard_url/5","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_path/2","title":"SandboxWeb.Router.Helpers.live_path/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_path/3","title":"SandboxWeb.Router.Helpers.live_path/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_url/2","title":"SandboxWeb.Router.Helpers.live_url/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#live_url/3","title":"SandboxWeb.Router.Helpers.live_url/3","type":"function"},{"doc":"Generates the path information including any necessary prefix.","ref":"SandboxWeb.Router.Helpers.html#path/2","title":"SandboxWeb.Router.Helpers.path/2","type":"function"},{"doc":"Generates an integrity hash to a static asset given its file path.","ref":"SandboxWeb.Router.Helpers.html#static_integrity/2","title":"SandboxWeb.Router.Helpers.static_integrity/2","type":"function"},{"doc":"Generates path to a static asset given its file path.","ref":"SandboxWeb.Router.Helpers.html#static_path/2","title":"SandboxWeb.Router.Helpers.static_path/2","type":"function"},{"doc":"Generates url to a static asset given its file path.","ref":"SandboxWeb.Router.Helpers.html#static_url/2","title":"SandboxWeb.Router.Helpers.static_url/2","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_path/3","title":"SandboxWeb.Router.Helpers.transaction_path/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_path/4","title":"SandboxWeb.Router.Helpers.transaction_path/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_path/5","title":"SandboxWeb.Router.Helpers.transaction_path/5","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_url/3","title":"SandboxWeb.Router.Helpers.transaction_url/3","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_url/4","title":"SandboxWeb.Router.Helpers.transaction_url/4","type":"function"},{"doc":"","ref":"SandboxWeb.Router.Helpers.html#transaction_url/5","title":"SandboxWeb.Router.Helpers.transaction_url/5","type":"function"},{"doc":"Generates the connection/endpoint base URL without any path information.","ref":"SandboxWeb.Router.Helpers.html#url/1","title":"SandboxWeb.Router.Helpers.url/1","type":"function"},{"doc":"This is an API that returns the balances in an account and transactions depending on the token provided. Token must be provided as basic Auth filling the name with the following format, password should be left empty. test_ &lt; token_id &gt; token_id must be any string with non special chars like _ .","ref":"readme.html","title":"Teller Sandbox API","type":"extras"},{"doc":"GET / accounts GET / accounts / :account_id GET / accounts / :account_id / details GET / accounts / :account_id / balances GET / accounts / :account_id / transactions GET / accounts / :account_id / transactions / :transaction_id","ref":"readme.html#endpoints","title":"Teller Sandbox API - Endpoints","type":"extras"},{"doc":"Install dependencies with mix deps.get Start Phoenix endpoint with mix phx.server or inside IEx with iex -S mix phx.server Or if you have docker just: docker - compose up - d","ref":"readme.html#to-start-your-phoenix-server","title":"Teller Sandbox API - To start your Phoenix server:","type":"extras"},{"doc":"Now you can visit localhost:4000 from your browser for getting real time data on endpoint usage.","ref":"readme.html#real-time-data","title":"Teller Sandbox API - Real time data","type":"extras"},{"doc":"localhost:4000/docs/index.html","ref":"readme.html#docs","title":"Teller Sandbox API - Docs","type":"extras"},{"doc":"mix test","ref":"readme.html#test","title":"Teller Sandbox API - Test","type":"extras"}]