import React from "react";

const Card = ({ team }) => {
  return (
    <div>
      <h1 className="text-2xl font-bold text-slate-800">{team.name}</h1>
    </div>
  );
};
export default Card;
