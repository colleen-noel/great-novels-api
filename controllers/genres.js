const models = require('../models')

const getAllNovelsAndAuthorsInAllGenres = async (request, response) => {
  try {
    const novelsInGenres = await models.Genres.findAll()

    return (novelsInGenres)
      ? response.send(novelsInGenres)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve genres, please try again')
  }
}

const getNovelsAndAuthorsByGenre = async (request, response) => {
  try {
    const { id } = request.params

    const novelsAndAuthorsByGenre = await models.Genres.findOne({
      where: { Id: id },
      include: [
        {
          model: models.Novels,
          include: [
            { model: models.Authors },
            {
              model: models.Genres,
              where: { id },
              attributes: []
            }]
        }]
    })


    return novelsAndAuthorsByGenre
      ? response.send(novelsAndAuthorsByGenre)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve genre, please try again')
  }
}

module.exports = { getAllNovelsAndAuthorsInAllGenres, getNovelsAndAuthorsByGenre }
