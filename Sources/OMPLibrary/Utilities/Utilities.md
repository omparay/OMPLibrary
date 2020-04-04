# Utilities

## HttpClient

### `typealias Header`

A simple alias for a `Dictionary<String: String>`

### `typeAlias ExecutionBlock`

Defined as a simple block of `(Result<Data, Error>) ->`. This type is normally the last parameter of HttpClient funbctions. The block will expect an input type of `Result` and execute code based on the subtype of `Success` or `Failure` cases of the input.

Example:

    //Sample Execution Block
    {
        (result) in
        switch result{
            case .success(let data):
            if let resultString = String(data: data) {
                debugPrint("Returned from service: \(resultString)")
            }
            case .error(let error):
            debugPrint("Error: \(error.localizedDescription)")
        }
    }

### `enum Method`

Enum specifying the primary HTTP methods supported by HttpClient:

* Delete
* Get
* Post
* Put

### `enum HttpClientError`

Enum specifying the types of errors that can be encountered by HttpClient as it executes requests:

* badUrl - You specified a malformed url for the request
* noData - The client did not recieve data when the request executed
* stringEncoding - You specified body data that cannot be encoded as UTF8

### `sharedInstance`

A singleton instance of the HttpClient. This is provided as a utility shortcut. You are well able to create your own instances if you want.

### `func request(async:,url:,method:,header:,data:,queue:,handler:)`

The primary HttpClient method. Parameters defined as:

* async: A `Bool` value indicating wether this request will be executed asynchronously or not. (Default if not specified is `true`)
* url: The URL of the request. This should include the protocol spec, the host and path to the resource and the query string.
* method: Use one of the values defined in the `Method` enum above.
* header: An optional dictionary whose values will be embedded in the request header.
* data: The optional body data for the request
* queue: An optional `GCD` queue that will execute the request
* handler: The requred execution handler which will process either the data returned by the request or any errors encountered during execution

Please note that there are variants of this function. Some will allow users to specify a `String` for the URL or the body data or both.

## Parser
