import React from "react";
import Team from "../teams/card";
import { useGetTeamsQuery } from "../../types/graphql";

const Home = () => {
  const { loading, error, data } = useGetTeamsQuery();

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  return data.teams.map((team) => <Team team={team} />);
};

export default Home;
