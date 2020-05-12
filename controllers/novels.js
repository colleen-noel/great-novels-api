const models = require('../models')

const getAllNovelsWithAuthorAndGenre = async (request, response) => {
  try {
    const allNovels = await models.Novels.findAll({
      include: [
        { model: models.Authors },
        { model: models.Genres }]
    })

    allNovels.forEach(novel => novel.genres.sort((lhs, rhs) => {
      if (lhs.name < rhs.name) {
        return -1
      }
      else if (lhs.name > rhs.name) {
        return 1
      }
      else {
        return 0
      }
    }))

    return (allNovels)
      ? response.send(allNovels)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve novels, please try again')
  }
}


const getNovelByIdWithAuthorAndGenre = async (request, response) => {
  try {
    const { id } = request.params

    const novel = await models.Novels.findOne({
      where: { Id: id },
      include: [
        { model: models.Authors },
        { model: models.Genres }]
    })

    return novel
      ? response.send(novel)
      : response.sendStatus(404)
  } catch (error) {
    response.status(500).send('Unable to retrieve novel, please try again')
  }
}

module.exports = { getAllNovelsWithAuthorAndGenre, getNovelByIdWithAuthorAndGenre }
