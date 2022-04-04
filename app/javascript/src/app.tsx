import React from "react";
import { Auth0Provider } from "@auth0/auth0-react";
import { ApolloClient, InMemoryCache, ApolloProvider } from "@apollo/client";
import Profile from "./auth/profile";

const client = new ApolloClient({
  uri: "/graph",
  cache: new InMemoryCache(),
});

const App = () => {
  return (
    <Auth0Provider
      domain="plybk.au.auth0.com"
      clientId="5kpApCa3ZUGD04zRu2eHxnsSIXvm4O4o"
      redirectUri={window.location.origin}
    >
      <ApolloProvider client={client}>
        <h1 class="bg-green-600 text-3xl font-bold underline">Hello World</h1>
        <Profile />
      </ApolloProvider>
    </Auth0Provider>
  );
};

export default App;
