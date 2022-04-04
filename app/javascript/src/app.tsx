import React from "react";
import { Auth0Provider } from "@auth0/auth0-react";
import {
  ApolloClient,
  InMemoryCache,
  ApolloProvider,
  ApolloLink,
  NormalizedCacheObject,
  from,
} from "@apollo/client";
import { setContext } from "@apollo/client/link/context";
import Main from "./common/main";
import { createUploadLink } from "apollo-upload-client";
import Navigation from "./common/navigation";
import { BrowserRouter } from "react-router-dom";
import { v1 as uuidv1 } from "uuid";
import { Md5 } from "ts-md5/dist/md5";
import Cookies from "js-cookie";

const tracingLink = new ApolloLink((operation, forward) => {
  operation.setContext(({ headers = {} }) => ({
    headers: {
      ...headers,
      "x-trace-id": Md5.hashStr(uuidv1()),
    },
  }));
  return forward(operation);
});

const authLink = setContext((_, { headers }) => {
  const token = Cookies.get("token") as string;
  return {
    headers: {
      ...headers,
      Authorization: token ? `Bearer ${token}` : "",
    },
  };
});

let client: ApolloClient<NormalizedCacheObject> | undefined = undefined;

const GraphProvider: FunctionComponent<{ graphURI: string }> = (props) => {
  if (client === undefined) {
    const uploadLink = createUploadLink({
      uri: "/graphql",
      credentials: "same-origin",
    });

    client = new ApolloClient({
      link: from([authLink, tracingLink, uploadLink]),
      cache: new InMemoryCache({}),
      name: "manage",
      version: "1.0",
      defaultOptions: {
        watchQuery: {
          fetchPolicy: "cache-first",
        },
      },
    });
  }
  return <ApolloProvider client={client}>{props.children}</ApolloProvider>;
};

const App = () => {
  return (
    <Auth0Provider
      domain="plybk.au.auth0.com"
      clientId="5kpApCa3ZUGD04zRu2eHxnsSIXvm4O4o"
      redirectUri={window.location.origin}
    >
      <GraphProvider client={client}>
        <BrowserRouter>
          <Navigation />
          <Main />
        </BrowserRouter>
      </GraphProvider>
    </Auth0Provider>
  );
};

export default App;
