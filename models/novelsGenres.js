const novelsGenres = (connection, Sequelize, Novels, Genres) => {
  return connection.define('novelsGenres', {
    novelId: { type: Sequelize.INTEGER, references: { model: Novels, key: 'novelId' } },
    genreId: { type: Sequelize.INTEGER, references: { model: Genres, key: 'genreId' } },
  }, {
    defaultScope: {
      attributes: { exclude: ['deletedAt'] }
    }
  }, {
    paranoid: true,
  })
}

module.exports = novelsGenres
