import React from "react";
import { Route, Routes } from "react-router";
import Home from "../home/home";

const Main = () => (
  <div className="min-h-full">
    <main className="-mt-32">
      <div className="mx-auto max-w-full px-4 pb-12 sm:px-6 lg:px-8">
        <div className="rounded-lg bg-white px-5 py-6 shadow sm:px-6">
          <Routes>
            <Route path="/" element={<Home />} />
          </Routes>
        </div>
      </div>
    </main>
  </div>
);

export default Main;
