module Types
  class MutationType < Types::BaseObject

    field :createPlay, mutation: Mutations::CreatePlay
    field :setPlayNotes, mutation: Mutations::SetPlayNotes
    field :setPlayName, mutation: Mutations::SetPlayName
    field :addPhase, mutation: Mutations::AddPhase
    field :addPlayer, mutation: Mutations::AddPlayer
    field :addPosition, mutation: Mutations::AddPosition
    field :movePosition, mutation: Mutations::MovePosition
    field :createLibrary, mutation: Mutations::CreateLibrary
    field :updateLibraryName, mutation: Mutations::UpdateLibraryName
    field :updateLibraryNotes, mutation: Mutations::UpdateLibraryNotes
    field :createTeam, mutation: Mutations::CreateTeam
    field :updateTeamName, mutation: Mutations::UpdateTeamName
    field :updateTeamCompetition, mutation: Mutations::UpdateTeamCompetition
    field :updateTeamSeason, mutation: Mutations::UpdateTeamSeason
    field :createDrill, mutation: Mutations::CreateDrill
    field :updateDrillName, mutation: Mutations::UpdateDrillName
    field :createPlayer, mutation: Mutations::CreatePlayer
    field :updatePlayerName, mutation: Mutations::UpdatePlayerName
  end
end
